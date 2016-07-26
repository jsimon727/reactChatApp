var ChatsList = React.createClass({
  getInitialState: function() {
    return(
      { showTypingIndicator: false }
    );
  },

  render: function(){
    var handleStatus = this.props.handleStatus;
    var inProgress;
    var messageStatus;

    if(this.props.messageSent) {
      if (this.props.selectedInputId === this.props.chatSectionId){
        messageStatus = "Sent"
      }
      else {
        messageStatus = "Received"
      }
    }

    if (this.props.inProgress) { 
      if (this.props.selectedInputId === this.props.chatSectionId){
        inProgress = <div></div>;
      }
      else {
        inProgress = <div>......</div>;
      }
    } else {
      inProgress = <div></div>;
    };

    var chats = this.props.chats.map(function(chat, index) {
      return (
        <ChatText messageStatus={messageStatus} text={chat.text} index={index} key={index} handleStatus={handleStatus} />
      );
    });

    return(<div><ul> {chats} </ul><div>{inProgress}</div></div>);
  }
});

