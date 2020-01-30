import consumer from "./consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let html = $('<div>',{
      'class' : 'message',
      'html': $('<div>',{
        'class' : 'author',
        'html' : data.username
      }).add($('<div>',{
        'class' : 'text',
        'html' : data.message
      }))
    })
    $('#messages').append(html);
  }
});
