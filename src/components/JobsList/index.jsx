import _ from 'lodash';
import React, { cloneElement, Component } from 'react';
import PropTypes from 'prop-types';
import { withStyles  } from 'material-ui/styles';
import List, {
  ListItem,
  ListItemAvatar,
  ListItemIcon,
  ListItemSecondaryAction,
  ListItemText,
} from 'material-ui/List';
import Avatar from 'material-ui/Avatar';
import IconButton from 'material-ui/IconButton';
import Button from 'material-ui/Button';
import { FormGroup } from 'material-ui/Form';
import { LabelCheckbox } from 'material-ui/Checkbox';
import Grid from 'material-ui/Grid';
import Typography from 'material-ui/Typography';
import FolderIcon from 'material-ui-icons/Folder';
import DeleteIcon from 'material-ui-icons/Delete';
// import { Link, IndexLink } from 'react-router'
import { Link } from 'react-router-dom'

import MyDeleteButton from './deleteButton'

const styles = theme => ({
  root: {
    flexGrow: 1,
    maxWidth: 752,
  },
  demo: {
    background: theme.palette.background.paper,
  },
  title: {
    margin: `${theme.spacing.unit * 4}px 0 ${theme.spacing.unit * 2}px`,
  },
});



class InteractiveList extends Component {
  state = {
    dense: false,
    secondary: true,
  };

  render() {
    const classes = this.props.classes;
    const { dense, secondary } = this.state;

    const { items, actions} = this.props;



    return (
      <div className={classes.demo}>
        <List dense={dense}>
          {
            _.map(items, (el, key) =>
              <Link to={`jobs/${key}`} key={key}>
                <ListItem  button>
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

                    {
                      (_.isFunction(actions.delete)) &&
                          <MyDeleteButton confirm={ () => actions.delete(key) }/>
                    }

                  </ListItemSecondaryAction>
                </ListItem>
              </Link>
            )}
        </List>
      </div>
    );
  }
}

InteractiveList.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(InteractiveList);
