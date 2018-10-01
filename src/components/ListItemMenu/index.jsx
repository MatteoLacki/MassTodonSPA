import React, { Component } from 'react';
import PropTypes from 'prop-types';
// import { withStyles, createStyleSheet } from '@material-ui/core/styles';
import List, { ListItem, ListItemText } from '@material-ui/core/List';
import Menu, { MenuItem } from '@material-ui/core/Menu';
const _ = require('lodash')

class SimpleListMenu extends Component {
  state = {
    anchorEl: undefined,
    open: false,
    isKeySelected: false,
    selectedKey: 0,
  };

  button = undefined;

  handleClickListItem = event => {
    this.setState({ open: true, anchorEl: event.currentTarget });
  };

  handleMenuItemClick = (event, key) => {
    this.setState({ selectedKey: key, isKeySelected: true, open: false });

    if(this.props.onSelect != null) {
      this.props.onSelect(key);
    }

  };

  handleRequestClose = () => {
    this.setState({ open: false });
  };

  render() {
    const classes = this.props.classes;
    const { label, elements } = this.props.listData

    return (
      <div className={classes.root}>
        <List>
          <ListItem
            button
            aria-haspopup="true"
            aria-controls="lock-menu"
            aria-label={label}
            onClick={this.handleClickListItem}
          >
            { this.state.isKeySelected ?
                <ListItemText
                  primary={label}
                  secondary={elements[this.state.selectedKey].name}
                />
                :
                <ListItemText
                  primary={label}
                />
            }
          </ListItem>
        </List>
        <Menu
          id="lock-menu"
          anchorEl={this.state.anchorEl}
          open={this.state.open}
          onRequestClose={this.handleRequestClose}
        >
          {_.map(elements, (el, key) =>
            <MenuItem
              key={key}
              selected={key === this.state.selectedKey}
              onClick={event => this.handleMenuItemClick(event, key)}
            >
              {el.name}
            </MenuItem>,
          )}
        </Menu>
      </div>
    );
  }
}

SimpleListMenu.propTypes = {
  classes: PropTypes.object.isRequired,
};

// export default withStyles(styleSheet)(SimpleListMenu);
export default SimpleListMenu
