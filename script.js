document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("treForm");
  const statusMessage = document.getElementById("statusMessage");

  // YOUR LOGIC APP HTTP TRIGGER URL
  const LOGIC_APP_URL = "https://prod-06.uksouth.logic.azure.com:443/workflows/ae95d8bc9250469b8f4da1d0927b4d60/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=zyop7N-T7b_0UwTtNA4ZIKs9AI7snbsP9PhTXPGV1L4";

  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    statusMessage.className = "hidden";
    statusMessage.textContent = "";

    const f = e.target;

    const payload = {
      workspaceName: f.workspaceName.value,
      requesterName: f.requesterName.value,
      requesterEmail: f.requesterEmail.value,
      managerEmail: f.managerEmail.value,
      template: f.template.value,
      urgency: f.urgency.value,
      submittedAt: new Date().toISOString()
    };

    console.log("Submitting payload:", payload);

    try {
      const response = await fetch(LOGIC_APP_URL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });

      // Accept 200, 202, 204
      if (![200, 202, 204].includes(response.status)) {
        const text = await response.text();
        throw new Error(text || "Submission failed");
      }

      statusMessage.textContent = "Request submitted successfully.";
      statusMessage.className = "success";

      form.reset();

    } catch (err) {
      console.error(err);
      statusMessage.textContent =
        "Failed to submit request. Check console.";
      statusMessage.className = "error";
    }
  });
});
