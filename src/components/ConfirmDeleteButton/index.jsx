import React, { Component } from "react";
import Button from "@material-ui/core/Button";

import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

import DeleteIcon from "@material-ui/icons/Delete";

export default class AlertDialog extends Component {
  state = {
    open: false
  };

  handleRequestClose = () => {
    this.setState({ open: false });
  };

  confirmClose = () => {
    this.setState({ open: false });
    this.props.confirm();
  };

  render() {
    const headerText =
      this.props.header || "Are you sure you want to remove this item?";
    const secondaryText =
      this.props.secondary || " This may not be recoverable.";

    return (
      <div>
        <Button
          color={this.props.color || "primary"}
          // color = { 'primary' }
          onClick={e => {
            this.setState({ open: true });
            e.stopPropagation();
            e.preventDefault();
          }}
          aria-label="Delete"
        >
          <DeleteIcon />
        </Button>
        {/*<Dialog open={this.state.open} onRequestClose={this.handleRequestClose}>*/}
        <Dialog open={this.state.open}>
          <DialogTitle>{headerText}</DialogTitle>
          <DialogContent>
            <DialogContentText>{secondaryText}</DialogContentText>
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleRequestClose} color="primary">
              Cancel
            </Button>
            <Button onClick={this.confirmClose} color="secondary">
              Delete
            </Button>
          </DialogActions>
        </Dialog>
      </div>
    );
  }
}
