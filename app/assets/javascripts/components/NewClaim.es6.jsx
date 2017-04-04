class NewClaim extends React.Component {
  constructor() {
    super();
    this.state = {
      showForm: false,
      status: "Claimed",
    };
    this.claimStatuses = ["Claimed", "Ordered", "Ready to Wrap", "Wrapped"];
  }

  handleClick() {
    if (this.state.showForm) {
      $.ajax({
        url:'/users/' + this.props.claimerUserId + "/claims",
        type: 'POST',
        data: {user_item_id: this.props.userItemId, status: this.state.status}
      }).done(
        this.setState({
          showForm: false
        })
      );

    } else {
      this.setState({
        showForm: true
      });
    }
  }

  handleStatusChange(e) {
    this.setState({
      status: e.currentTarget.value
    });
  }

  render () {
    const statuses = this.claimStatuses.slice(); // copy
    const statusInputs = statuses.map((status, i) => {
      return (
        <label key={status}>
          <input type="radio" name="claim_status" defaultChecked={(status==="Claimed")} value={status} onChange={(e) => this.handleStatusChange(e)}/>{status}
        </label>
      );
    });
    return (
      <span>
        <button onClick={() => this.handleClick()}>{this.state.showForm ? "Save" : "Claim"}</button>
        {this.state.showForm ? statusInputs : null}
      </span>
    );
  }
}

NewClaim.propTypes = {
  userItemId: React.PropTypes.number,
  claimerUserId: React.PropTypes.number
};
