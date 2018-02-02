import React, { Component } from 'react';
import Button from 'material-ui/Button';
import Dialog, {
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
} from 'material-ui/Dialog';
import DeleteIcon from 'material-ui-icons/Delete';

export default class AlertDialog extends Component {
  state = {
    open: false,
  };

  handleRequestClose = () => {
    this.setState({ open: false });
  };

  confirmClose = () =>
  {
    this.setState({ open: false });
    this.props.confirm()
  };

  render() {
    return (
      <div>
        <Button
          color = 'primary'
          onClick={(e) => {
            this.setState({ open: true });
            e.stopPropagation();
            e.preventDefault();
          }}
          aria-label= "Delete"
        >
           <DeleteIcon />
        </Button>
        <Dialog open={this.state.open} onRequestClose={this.handleRequestClose}>
          <DialogTitle>Do you want to remove this job?</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Removing this job will also remove thee results
            </DialogContentText>
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleRequestClose} color="primary">Cancel</Button>
            <Button onClick={this.confirmClose} color="accent">Delete</Button>
          </DialogActions>
        </Dialog>
      </div>
    );
  }
}
