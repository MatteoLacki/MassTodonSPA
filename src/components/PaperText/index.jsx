import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, createStyleSheet } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import Typography from 'material-ui/Typography';

const styleSheet = {
  root: {
    paddingTop: 16,
    paddingBottom: 16,
  }
};
function PaperSheet(props) {
  const classes = props.classes;
  const { header, body } = props
  return (
    <div>
      <Paper className={classes.root} elevation={4}>
        <Typography type="headline" component="h3">
          {header}
        </Typography>
        <Typography type="body1" component="p">
          {body}
        </Typography>
      </Paper>
    </div>
  );
}

PaperSheet.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styleSheet)(PaperSheet);
