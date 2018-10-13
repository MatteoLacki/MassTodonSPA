import _ from "lodash";
import React, { Component } from "react";
import PropTypes from "prop-types";
import { withStyles } from "@material-ui/core/styles";

import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import ListItemText from "@material-ui/core/ListItemText";


import Avatar from "@material-ui/core/Avatar";
import FolderIcon from "@material-ui/icons/Folder";
// import { Link, IndexLink } from 'react-router'
import { Link } from "react-router-dom";

import MyDeleteButton from "./deleteButton";

const styles = theme => ({
  root: {
    flexGrow: 1,
    maxWidth: 752
  },
  demo: {
    background: theme.palette.background.paper
  },
  title: {
    margin: `${theme.spacing.unit * 4}px 0 ${theme.spacing.unit * 2}px`
  }
});

class InteractiveList extends Component {
  state = {
    dense: false,
    secondary: true
  };

  render() {
    const classes = this.props.classes;
    const { dense } = this.state;
    const { items, actions } = this.props;

    return (
      <div className={classes.demo}>
        <List dense={dense}>
          {_.map(items, (el, key) => (
            <Link to={`jobs/${key}`} key={key}>
              <ListItem button>
                <ListItemAvatar>
                  <Avatar>
                    <FolderIcon />
                  </Avatar>
                </ListItemAvatar>
                <ListItemText
                  primary={el.label}
                  secondary={el.secondary ? el.secondary : null}
                />
                <ListItemSecondaryAction>
                  {_.isFunction(actions.delete) && (
                    <MyDeleteButton confirm={() => actions.delete(key)} />
                  )}
                </ListItemSecondaryAction>
              </ListItem>
            </Link>
          ))}
        </List>
      </div>
    );
  }
}

InteractiveList.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(InteractiveList);
