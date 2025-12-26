// API Configuration
const API_ENDPOINT = 'https://prod-06.uksouth.logic.azure.com:443/workflows/ae95d8bc9250469b8f4da1d0927b4d60/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=zyop7N-T7b_0UwTtNA4ZIKs9AI7snbsP9PhTXPGV1L4';

// DOM Elements
const form = document.getElementById('treRequestForm');
const submitButton = form.querySelector('.btn-submit');
const resetButton = document.getElementById('resetButton');
const successMessage = document.getElementById('successMessage');
const infrastructureTemplate = document.getElementById('infrastructureTemplate');
const infrastructureOtherGroup = document.getElementById('infrastructureOtherGroup');
const infrastructureOther = document.getElementById('infrastructureOther');

// Show/hide "Other" text field
infrastructureTemplate.addEventListener('change', function () {
    if (this.value === 'Other') {
        infrastructureOtherGroup.classList.remove('hidden');
        infrastructureOther.required = true;
    } else {
        infrastructureOtherGroup.classList.add('hidden');
        infrastructureOther.required = false;
        infrastructureOther.value = '';
    }
});

// Helper to generate workspace name
function generateWorkspaceName() {
    const department = document.getElementById('department').value.trim();
    const requestType = document.getElementById('requestType').value.trim();

    return [department, requestType]
        .filter(Boolean)
        .join('-')
        .toLowerCase()
        .replace(/[^a-z0-9-]/g, '-')
        .replace(/-+/g, '-')
        .replace(/^-|-$/g, '');
}

// Form submission
form.addEventListener('submit', function (e) {
    e.preventDefault();

    if (!form.checkValidity()) {
        return;
    }

    const payload = {
        // Backward-compatible fields
        workspaceName: generateWorkspaceName(),
        owner: document.getElementById('requesterName').value.trim(),

        // Full structured intake
        requester: {
            name: document.getElementById('requesterName').value.trim(),
            email: document.getElementById('requesterEmail').value.trim(),
            department: document.getElementById('department').value.trim(),
            role: document.getElementById('role').value.trim()
        },

        lineManager: {
            name: document.getElementById('lineManagerName').value.trim(),
            email: document.getElementById('lineManagerEmail').value.trim()
        },

        request: {
            type: document.getElementById('requestType').value.trim(),
            urgency: document.getElementById('urgency').value.trim(),
            expectedDuration: document.getElementById('expectedDuration').value.trim()
        },

        justification: {
            business: document.getElementById('businessJustification').value.trim(),
            research: document.getElementById('researchJustification').value.trim()
        },

        infrastructure: {
            template: infrastructureTemplate.value,
            other: infrastructureOther.value.trim()
        }
    };

    submitButton.disabled = true;
    submitButton.textContent = 'Submitting...';

    fetch(API_ENDPOINT, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    })
        .then(r => {
            if (!r.ok) throw new Error('Submission failed');
        })
        .catch(err => console.error(err));

    successMessage.style.display = 'block';
    form.reset();
    infrastructureOtherGroup.classList.add('hidden');
    submitButton.disabled = false;
    submitButton.textContent = 'Submit Request';
});
