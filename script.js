// TRE Request Form JavaScript
//
// Key behaviours:
// - Runs on GitHub Pages (static)
// - Submits to Logic App 1 (HTTP trigger)
// - Does NOT block the UI waiting for approvals or downstream automation
// - Generates workspaceName from user inputs (requesters do not type it)
// - Sends owner as a fixed value (Yassin) to keep tag policy simple

// Keep this hard-coded unless you explicitly want to change it
const LOGIC_APP_URL = 'https://prod-03.uksouth.logic.azure.com:443/workflows/97d1ed81cffe45a58d579f1f1db89b1c/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=Eib7Q35lCdAuklT4oKA9uVUd3UeWqd1siZb2muCzC84';

// Fixed owner to avoid tag policy conflicts for now
const FIXED_OWNER = 'Yassin';

document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('treRequestForm');
  const submitButton = document.getElementById('submitButton');
  const loadingMessage = document.getElementById('loadingMessage');
  const successMessage = document.getElementById('successMessage');
  const successTitle = document.getElementById('successTitle');
  const successBody = document.getElementById('successBody');

  // Other field groups
  const infrastructureTemplate = document.getElementById('infrastructureTemplate');
  const infrastructureOtherGroup = document.getElementById('infrastructureOtherGroup');

  const jobTitle = document.getElementById('jobTitle');
  const jobTitleOtherGroup = document.getElementById('jobTitleOtherGroup');

  const department = document.getElementById('department');
  const departmentOtherGroup = document.getElementById('departmentOtherGroup');

  const requestType = document.getElementById('requestType');
  const requestTypeOtherGroup = document.getElementById('requestTypeOtherGroup');

  // Hide success initially
  successMessage.style.display = 'none';
  loadingMessage.style.display = 'none';

  // Toggle “Other” fields
  const toggleOther = (selectEl, otherGroupEl, otherInputId) => {
    const isOther = (selectEl.value || '') === 'Other';
    if (isOther) {
      otherGroupEl.classList.remove('hidden');
      const otherInput = document.getElementById(otherInputId);
      if (otherInput) otherInput.required = true;
    } else {
      otherGroupEl.classList.add('hidden');
      const otherInput = document.getElementById(otherInputId);
      if (otherInput) {
        otherInput.required = false;
        otherInput.value = '';
      }
    }
  };

  infrastructureTemplate.addEventListener('change', () => toggleOther(infrastructureTemplate, infrastructureOtherGroup, 'infrastructureOther'));
  jobTitle.addEventListener('change', () => toggleOther(jobTitle, jobTitleOtherGroup, 'jobTitleOther'));
  department.addEventListener('change', () => toggleOther(department, departmentOtherGroup, 'departmentOther'));
  requestType.addEventListener('change', () => toggleOther(requestType, requestTypeOtherGroup, 'requestTypeOther'));

  // Initialise toggle states
  toggleOther(infrastructureTemplate, infrastructureOtherGroup, 'infrastructureOther');
  toggleOther(jobTitle, jobTitleOtherGroup, 'jobTitleOther');
  toggleOther(department, departmentOtherGroup, 'departmentOther');
  toggleOther(requestType, requestTypeOtherGroup, 'requestTypeOther');

  const sanitizeSlug = (value, maxLen) => {
    const raw = (value || '').toString().trim().toLowerCase();
    const slug = raw
      .replace(/&/g, ' and ')
      .replace(/[^a-z0-9]+/g, '-')   // non-alnum -> hyphen
      .replace(/-+/g, '-')           // collapse hyphens
      .replace(/^-|-$/g, '');        // trim hyphens
    if (!slug) return 'na';
    return slug.length > maxLen ? slug.slice(0, maxLen) : slug;
  };

  const randomSuffix = (len = 4) => {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    let out = '';
    for (let i = 0; i < len; i++) out += chars[Math.floor(Math.random() * chars.length)];
    return out;
  };

  const getSelectWithOther = (selectId, otherInputId) => {
    const selectEl = document.getElementById(selectId);
    const otherEl = document.getElementById(otherInputId);
    if (!selectEl) return '';
    if ((selectEl.value || '') === 'Other') {
      return (otherEl?.value || '').trim();
    }
    return (selectEl.value || '').trim();
  };

  const generateWorkspaceName = () => {
    // You said: no region from requester, everything is London (UK South) anyway
    // Naming: rgtrews-{dept}-{template}-{urgency}-{rand}
    const dept = getSelectWithOther('department', 'departmentOther');
    const template = getSelectWithOther('infrastructureTemplate', 'infrastructureOther');
    const urg = (document.getElementById('urgency')?.value || 'Normal').toLowerCase() === 'urgent' ? 'u' : 'n';

    const deptCode = sanitizeSlug(dept, 10);
    const templateCode = sanitizeSlug(template, 12);

    return `rgtrews-${deptCode}-${templateCode}-${urg}-${randomSuffix(4)}`;
  };

  const setUiSubmitting = (isSubmitting) => {
    submitButton.disabled = isSubmitting;
    loadingMessage.style.display = isSubmitting ? 'block' : 'none';
  };

  const showSuccess = (workspaceName) => {
    successTitle.textContent = 'Request submitted';
    successBody.textContent =
      `Request submitted for approval. Generated workspace name: ${workspaceName}. ` +
      `Approvals can take time (for example up to 2 business days). If it is urgent, contact the platform team.`;
    successMessage.style.display = 'block';
  };

  const showSoftError = (msg) => {
    successTitle.textContent = 'Request sent, but we could not confirm delivery';
    successBody.textContent =
      `${msg} ` +
      `If you do not receive an approval email shortly, contact the platform team.`;
    successMessage.style.display = 'block';
  };

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    // Reset messages
    successMessage.style.display = 'none';

    // Basic browser validation
    if (!form.checkValidity()) {
      form.reportValidity();
      return;
    }

    setUiSubmitting(true);

    // Build request payload
    const workspaceName = generateWorkspaceName();

    const payload = {
      // Required by Logic App 1 schema
      workspaceName,
      owner: FIXED_OWNER,

      // Request context for email + future routing
      requesterDetails: {
        name: document.getElementById('requesterName').value.trim(),
        email: document.getElementById('requesterEmail').value.trim(),
        jobTitle: getSelectWithOther('jobTitle', 'jobTitleOther'),
        department: getSelectWithOther('department', 'departmentOther')
      },
      requestType: getSelectWithOther('requestType', 'requestTypeOther'),
      infrastructureTemplate: getSelectWithOther('infrastructureTemplate', 'infrastructureOther'),
      urgency: document.getElementById('urgency').value,
      dataSensitivity: document.getElementById('dataSensitivity').value,
      additionalDetails: (document.getElementById('additionalDetails').value || '').trim(),
      submittedAtUtc: new Date().toISOString()
    };

    // Fire the request without blocking the UI.
    // We still *attempt* to detect immediate errors, but we do not wait for approvals.
    fetch(LOGIC_APP_URL, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    })
      .then(async (resp) => {
        if (!resp.ok) {
          const body = await resp.text().catch(() => '');
          throw new Error(`Logic App responded ${resp.status}. ${body}`.trim());
        }
        return resp.text().catch(() => '');
      })
      .catch((err) => {
        // Non-blocking: user already sees a success banner,
        // but if it fails quickly we update the message.
        console.error('Submit error:', err);
        showSoftError('The request may not have been accepted by the API.');
      });

    // Immediately update UI and release the user
    showSuccess(workspaceName);
    form.reset();

    // Re-hide “Other” fields after reset
    toggleOther(infrastructureTemplate, infrastructureOtherGroup, 'infrastructureOther');
    toggleOther(jobTitle, jobTitleOtherGroup, 'jobTitleOther');
    toggleOther(department, departmentOtherGroup, 'departmentOther');
    toggleOther(requestType, requestTypeOtherGroup, 'requestTypeOther');

    setUiSubmitting(false);
  });
});
