var Form = React.createClass({
    getInitialState: function(){
      return(
        { inputText: "" },
        { submitText: "Send" }
      )
    },

    render: function(){
        return(
          <div>
            <input type='text' placeholder="Say something..." inProgress={ false } value={ this.state.inputText } onChange={ this.props.handleTextInput.bind(null, event, this.props.inputId) } />
            <input type='submit' onClick={ this.props.addChat } value={this.state.submitText}/>
          </div>
        );
    }
});
