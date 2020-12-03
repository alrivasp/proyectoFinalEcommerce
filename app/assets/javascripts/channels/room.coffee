App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#messages").append data['message']

  speak: (message,sender,received) ->
    @perform 'speak',  {message: message, sender: sender, received: received}

  $(document).on 'keypress', '[data-behavior~=room_speaker]',(event) ->
    if event.keyCode is 13
      sender_id = this.attributes["data-sender"].value
      received_id = this.attributes["data-received"].value
      App.room.speak event.target.value, sender_id, received_id
      event.target.value = ''
      $('#messages').animate { scrollTop: $('#messages').prop('scrollHeight') }, 1000
      event.preventDefault()