$(document).on('turbolinks:load', function() {
    $(function() {
        let form = document.getElementById('contacts_search');

        form.addEventListener('ajax:success', contactSearch);
    });
});

function contactSearch(event) {
    const users = event.detail[0].found_users;
    const search = event.detail[0].search;
    const result_element = document.getElementById('contact_search_result');

    // empty div
    while (result_element.lastChild){
        result_element.lastChild.remove();
    }

    //fill div with new elements
    for (let user of users){
        let p = document.createElement('P');
        p.className = 'contact';
        p.appendChild(document.createTextNode(user));
        result_element.appendChild(p)
    }
}
