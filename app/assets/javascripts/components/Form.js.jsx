var Form = React.createClass({
  render: function(){
    var Button = ReactBootstrap.Button;
    var Form = ReactBootstrap.Form;
    var FormGroup = ReactBootstrap.FormGroup;
    var FormControl = ReactBootstrap.FormControl;

    var formStyle = {
      position: 'absolute',
      bottom: '10px',
      left: '10px'
    }

    return(
      <Form inline style={formStyle}>
        <FormGroup>
          <FormControl type='text' placeholder="Say something..." inProgress={ false } onChange={ this.props.handleTextInput.bind(null, event, this.props.inputId) } />
        </FormGroup>
        <Button type='submit' onClick={ this.props.addChat }>Send</Button>
      </Form>
    );
  }
});
