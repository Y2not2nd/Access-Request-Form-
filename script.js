document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("treRequestForm");
    const successMessage = document.getElementById("successMessage");
    const resetButton = document.getElementById("resetButton");

    const LOGIC_APP_URL = "https://prod-03.uksouth.logic.azure.com:443/workflows/97d1ed81cffe45a58d579f1f1db89b1c/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=Eib7Q35lCdAuklT4oKA9uVUd3UeWqd1siZb2muCzC84";

    resetButton.addEventListener("click", () => {
        form.reset();
        successMessage.style.display = "none";
    });

    form.addEventListener("submit", async (e) => {
        e.preventDefault();

        // Basic required field check (HTML already enforces most of this)
        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }

        // Disable submit button immediately
        const submitButton = form.querySelector(".btn-submit");
        submitButton.disabled = true;

        // Build payload expected by Logic App 1
        // IMPORTANT: We are NOT inventing workspace names here yet
        const payload = {
            workspaceName: "pending-auto-generation",
            owner: "Yassin"
        };

        try {
            // Fire-and-forget style request
            const response = await fetch(LOGIC_APP_URL, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(payload)
            });

            // We EXPECT 202 Accepted
            if (response.status === 202 || response.ok) {
                successMessage.innerHTML = `
                    Request submitted successfully.<br><br>
                    <strong>What happens next:</strong><br>
                    • Your request has entered the approval workflow<br>
                    • Processing may take several business days<br>
                    • You will receive email notifications as approvals progress<br><br>
                    If this request is urgent, please contact the Scopus IT team at
                    <strong>it-support@scopus.example</strong>
                `;
                successMessage.style.display = "block";
                form.reset();
            } else {
                throw new Error(`Unexpected response status: ${response.status}`);
            }
        } catch (err) {
            alert(
                "Your request could not be submitted at this time.\n\n" +
                "Please try again later or contact the Scopus IT team at it-support@scopus.example."
            );
            console.error("Submission error:", err);
        } finally {
            // ALWAYS release UI
            submitButton.disabled = false;
        }
    });
});
