/**
 * Validação de Formulários — Crochê Mania (MVC / Jakarta EE)
 * Suporte integrado para validação customizada e Bootstrap .needs-validation
 */
(() => {
    'use strict';

    document.addEventListener("DOMContentLoaded", () => {
        // Validação Bootstrap padrão
        const forms = document.querySelectorAll('.needs-validation');

        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                // Checagem de espaços em branco em campos de texto
                const inputs = form.querySelectorAll('input[type="text"], input[type="email"], input[type="password"]');
                let customValido = true;

                inputs.forEach(input => {
                    if (input.required && (!input.value || /^\s*$/.test(input.value))) {
                        input.setCustomValidity("Preenchimento obrigatório sem apenas espaços.");
                        customValido = false;
                    } else {
                        input.setCustomValidity("");
                    }
                });

                if (!form.checkValidity() || !customValido) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);

            // Limpa validação customizada ao digitar
            form.querySelectorAll('input').forEach(input => {
                input.addEventListener('input', () => {
                    input.setCustomValidity("");
                });
            });
        });
    });
})();
