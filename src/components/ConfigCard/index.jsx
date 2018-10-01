import _ from "lodash";
import React from "react";
import Card, { CardContent } from "@material-ui/core/Card";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
import ConfirmDeleteButton from "components/ConfirmDeleteButton";

const styleSheet = theme => ({
  card: {
    display: "flex",
    justifyContent: "space-between"
  },
  details: {
    display: "flex",
    flexDirection: "column",
    flexGrow: 5
  },
  content: {
    flex: "4 1 auto"
  },
  actions: {
    display: "flex",
    flexGrow: 1,
    flexDirection: "row",
    justifyContent: "flex-end",
    flexWrap: "nowrap",
    alignItems: "center",
    marginRight: `${theme.spacing.unit}px`
  },
  cover: {
    width: 151,
    height: 151,
    flexGrow: 1
  },
  controls: {
    display: "flex",
    alignItems: "center",
    paddingLeft: 8,
    paddingBottom: 8
  },
  playIcon: {
    height: 38,
    width: 38
  }
});

function MyConfigCard(props) {
  const { actions, classes } = props;
  return (
    <Card className={classes.card}>
      <div className={classes.cover}>
        <img
          src="https://placeholdit.co//i/60x60"
          alt="Live from space album cover"
        />
      </div>
      <div className={classes.details}>
        <CardContent className={classes.content}>
          <Typography type="headline">{props.name}</Typography>
          {/*
              <Typography type="subheading" color="secondary">
                Mac Miller
              </Typography>
            */}
        </CardContent>
        {/*
              <div className={classes.controls}>
              <IconButton aria-label="Previous">
                <SkipPreviousIcon />
              </IconButton>
              <IconButton aria-label="Play/pause">
                <PlayArrowIcon className={classes.playIcon} />
              </IconButton>
              <IconButton aria-label="Next">
                <SkipNextIcon />
              </IconButton>
            </div>
          */}
      </div>
      <div className={classes.actions}>
        {_.isFunction(actions.delete) && (
          <ConfirmDeleteButton
            confirm={actions.delete}
            header="Are you sure you want to remove this config?"
            secondary="You will not be able to reuse this config, but existing jobs will keep a copy of it."
          />
        )}
        {/*
            <IconButton aria-label="Delete">
              <DeleteIcon />
            </IconButton>
          */}
      </div>
    </Card>
  );
}

// Card.propTypes = {
//   classes: PropTypes.object.isRequired,
// };

export default withStyles(styleSheet, { withTheme: true })(MyConfigCard);
