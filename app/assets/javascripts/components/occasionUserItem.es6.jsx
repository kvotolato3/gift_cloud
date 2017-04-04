class OccasionUserItem extends React.Component {
  constructor() {
    super();
    this.state = {
      claims: [], //TODO: Get claims from db
    };
  }
  claimExists(){
    return this.state.claims.length >= 1
  }
  render () {
    return (
      <li>
        {this.props.userItem.name}
        {this.claimExists() ? null : <NewClaim claimerUserId={this.props.currentUserId} userItemId={this.props.userItem.id}/> }
      </li>
    );
  }
}

OccasionUserItem.propTypes = {
  userItem: React.PropTypes.object,
  currentUserId: React.PropTypes.number
};
