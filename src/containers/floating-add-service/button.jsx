import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, createStyleSheet } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import AddIcon from '@material-ui/icons/Add';
import ModeEditIcon from '@material-ui/icons/ModeEdit';

const styleSheet = {
  button: {
    position: 'fixed',
    margin: '0px',
    top: 'auto',
    right: '30px',
    bottom: '20px',
    left: 'auto'
  },
};

function FloatingActionButtons(props) {
  const classes = props.classes;
  return (
    <Button fab color="primary" className={classes.button}>
      <AddIcon />
    </Button>
  );
}

FloatingActionButtons.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styleSheet)(FloatingActionButtons);
