import { search } from "./search";

$(document).on('turbolinks:load', function() {
    $(function() {
        let chat_search_form = document.getElementById('chats_search');

        if (chat_search_form)
            chat_search_form.addEventListener('ajax:success', {
                handleEvent: search,
                result_element: document.getElementById('chat_search_result')
            });
    });
});