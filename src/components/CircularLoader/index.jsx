import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, createStyleSheet } from '@material-ui/core/styles';
import { CircularProgress } from '@material-ui/core/Progress';

const styleSheet = createStyleSheet('CircularIndeterminate', theme => ({
  progress: {
    margin: `0 ${theme.spacing.unit * 2}px`,
  },
}));

function CircularIndeterminate(props) {
  const classes = props.classes;
  return (
    <CircularProgress className={classes.progress} size={50} />
  );
}

CircularIndeterminate.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styleSheet)(CircularIndeterminate);
