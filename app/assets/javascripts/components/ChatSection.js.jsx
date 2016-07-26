var ChatSection = React.createClass({
  getInitialState: function() {
    return(
      { chats: this.props.chats }
    );
  },

  render: function(){
    return(
      <div>
        <ChatsList messageSent={this.props.messageSent} selectedInputId={ this.props.selectedInputId } chatSectionId={ this.props.chatSectionId } chats={ this.props.chats } inProgress={ this.props.inProgress } />
        <Form clearInput={this.props.clearInput} inputId={ this.props.chatSectionId } addChat={ this.props.addChat } handleTextInput={ this.props.handleTextInput }/>
      </div>
    );
  }
});
