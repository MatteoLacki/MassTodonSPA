import React, { Component } from 'react';
import Button from 'material-ui/Button';
import IconButton from 'material-ui/IconButton';
import Dialog, {
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
} from 'material-ui/Dialog';
import DeleteIcon from 'material-ui-icons/Delete';

export default class DeleteIconWithConfirm extends Component {
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

  handleCLick = (e) => {
    this.setState({ open: true });
    e.stopPropagation();
    e.preventDefault();
  }

  render() {


    const headerText    = this.props.header    || 'Are you sure you want to remove this item?'
    const secondaryText = this.props.secondary || ' This may not be recoverable.'


    return (
      <div>
        <IconButton
          color = { this.props.color }
          onClick={ this.handleCLick }
          aria-label= { this.props['aria-label'] }
        >
           <DeleteIcon />
        </IconButton>
        <Dialog open={this.state.open} onRequestClose={this.handleRequestClose}>
          <DialogTitle>{headerText}</DialogTitle>
          <DialogContent>
            <DialogContentText>
              {secondaryText}
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
