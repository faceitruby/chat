import { search } from "./search";

$(document).on('turbolinks:load', function() {
    $(function() {
        let contact_search_form = document.getElementById('contacts_search');

        if (contact_search_form)
            contact_search_form.addEventListener('ajax:success', {
                handleEvent: search,
                result_element: document.getElementById('contact_search_result')
            });
    });
});
