const contactEmail = "biuro@bt-woodstudio.com";

export function initializeContactForms() {
  const forms = document.querySelectorAll<HTMLFormElement>(
    "[data-contact-form]",
  );

  forms.forEach((form) => {
    form.addEventListener("submit", (event) => {
      event.preventDefault();

      const formData = new FormData(form);
      const name = String(formData.get("name") ?? "").trim();
      const email = String(formData.get("email") ?? "").trim();
      const subject = String(formData.get("subject") ?? "").trim();
      const message = String(formData.get("message") ?? "").trim();

      const body = [
        `Imię / firma: ${name}`,
        `E-mail: ${email}`,
        "",
        message,
      ].join("\n");
      const mailto = `mailto:${contactEmail}?subject=${encodeURIComponent(
        `Zapytanie ze strony: ${subject}`,
      )}&body=${encodeURIComponent(body)}`;

      window.location.href = mailto;

      const status = form.querySelector<HTMLElement>("[data-form-status]");
      if (status) {
        status.textContent =
          "Przygotowaliśmy wiadomość w Twoim programie pocztowym. Jeśli się nie otworzył, napisz bezpośrednio na biuro@bt-woodstudio.com.";
      }
    });
  });
}
