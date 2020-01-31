$(document).on('turbolinks:load', function() {
    $(function() {
        let contact_search_form = document.getElementById('contacts_search');
        let chat_search_form = document.getElementById('chats_search');

        if (contact_search_form)
            contact_search_form.addEventListener('ajax:success', {
                handleEvent: search,
                result_element: document.getElementById('contact_search_result')
            });
        if (chat_search_form)
            chat_search_form.addEventListener('ajax:success', {
                handleEvent: search,
                result_element: document.getElementById('chat_search_result')
            });
    });
});

function search(event) {
    if (event.detail[0].found && event.detail[0].search) {
        let result_element = this.result_element;
        const elements = event.detail[0].found;

        // empty div
        while (result_element.lastChild) {
            result_element.lastChild.remove();
        }

        //fill div with new elements
        for (let el of elements) {
            let p = document.createElement('P');
            p.className = 'found_record';
            p.appendChild(document.createTextNode(el));
            result_element.appendChild(p)
        }
    }
}
