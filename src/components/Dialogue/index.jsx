import _ from 'lodash';
import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { withStyles, createStyleSheet } from '@material-ui/core/styles';
import List, { ListItem, ListItemText } from '@material-ui/core/List';
import Menu, { MenuItem } from '@material-ui/core/Menu';
import Typography from '@material-ui/core/Typography';



const styleSheet = {
  root: {
    width: '100%',
    maxWidth: 360,
    // background: theme.palette.background.paper,
    background: '#cccccc',
  },
  miniError: {
    color: '#FF0000',
    // paddingLeft: `${ theme.spacing.unit * 2}px`
    paddingLeft: 16
  }
};


class SimpleListMenu extends Component {
  state = {
    anchorEl: undefined,
    open: false,
    selectedIndex: 0,
    selectedText: 'None',
  };

  button = undefined;

  handleClickListItem = event => {
    this.setState({ open: true, anchorEl: event.currentTarget });
  };

  handleMenuItemClick = (event, key) => {
    const item = _.find(this.props.options, {key: key})

    if(item != null){
      this.setState({
        selectedIndex: key,
        open: false,
        selectedText: item.name
      });

      this.props.onChange(item.key)
    }
  };

  handleRequestClose = () => {
    this.setState({ open: false });

  };

  componentDidMount = () => {
    this.setState({
      selectedIndex: this.props.selectedIndex
    });
    this.handleMenuItemClick(null, this.props.selectedIndex)

  }


  render() {
    const { classes, options, error, helperText } = this.props
    return (
      <div className={classes.root}>
        <List>
          <ListItem
            button
            aria-haspopup="true"
            aria-controls="menu"
            aria-label={this.props.label}
            onClick={this.handleClickListItem}
          >
            <ListItemText
              primary={this.props.label}
              secondary={this.state.selectedText}
            />
          </ListItem>
          {
            (this.props.error) &&
              <Typography type="caption" className={classes.miniError} >
                {this.props.helperText}
              </Typography>
          }
        </List>
        <Menu
          id="menu"
          anchorEl={this.state.anchorEl}
          open={this.state.open}
          onRequestClose={this.handleRequestClose}
        >
          {options.map((option, index) =>
            <MenuItem
              key={option.key}
              selected={option.key === this.state.selectedIndex}
              onClick={event => this.handleMenuItemClick(event, option.key)}
            >
              {option.name}
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

export default withStyles(styleSheet)(SimpleListMenu);
