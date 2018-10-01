import React, { Component } from "react";
import PropTypes from "prop-types";
import { withStyles, createStyleSheet } from "@material-ui/core/styles";
import { LinearProgress } from "@material-ui/core/Progress";

const styleSheet = {
  root: {
    width: "100%"
  }
};

function MyLiniarPropgress(props) {
  const { progress, classes } = props;
  return (
    <div className={classes.root}>
      <LinearProgress mode="determinate" value={progress} />
    </div>
  );
}

// MyLiniarPropgress.propTypes = {
//   classes: PropTypes.object.isRequired,
// };

export default withStyles(styleSheet)(MyLiniarPropgress);
