import React from "react";
import { observer } from "mobx-react";
// import PropTypes from 'prop-types';
import { withStyles } from "@material-ui/core/styles";
import classNames from "classnames";
import Drawer from "@material-ui/core/Drawer";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import IconButton from "@material-ui/core/IconButton";
import MenuIcon from "@material-ui/icons/Menu";
import ChevronLeftIcon from "@material-ui/icons/ChevronLeft";
import ChevronRightIcon from "@material-ui/icons/ChevronRight";

import MenuContent from "./menu-content";
import ui from "data/ui/drawer";

const drawerWidth = 240;

const styles = theme => ({
  root: {
    width: "100%",
    height: "100%",
    // marginTop: theme.spacing.unit * 3,
    zIndex: 1,
    overflow: "hidden"
  },
  appFrame: {
    position: "relative",
    display: "flex",
    width: "100%",
    height: "100%"
  },
  appBar: {
    position: "absolute",
    zIndex: theme.zIndex.drawer + 1,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen
    })
  },
  appBarShift: {
    marginLeft: drawerWidth,
    width: `calc(100% - ${drawerWidth}px)`,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen
    })
  },
  menuButton: {
    marginLeft: 12,
    marginRight: 36
  },
  hide: {
    display: "none"
  },
  drawerPaper: {
    position: "relative",
    height: "100%",
    width: drawerWidth,
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen
    })
  },
  drawerPaperClose: {
    width: 60,
    overflowX: "hidden",
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen
    })
  },
  drawerInner: {
    // Make the items inside not wrap when transitioning:
    width: drawerWidth,
    height: "100vh"
  },
  drawerHeader: {
    display: "flex",
    alignItems: "center",
    justifyContent: "flex-end",
    padding: "0 8px",
    ...theme.mixins.toolbar
  },
  content: {
    width: "100%",
    flexGrow: 1,
    backgroundColor: theme.palette.background.default,
    padding: 24,
    height: "calc(100% - 56px)",
    minHeight: "100vh",
    marginTop: 56,
    [theme.breakpoints.up("sm")]: {
      height: "calc(100% - 64px)",
      marginTop: 64
    }
  }
});

class MiniDrawer extends React.Component {
  displayName = "MiniDrawer";
  state = {
    open: false
  };
  handleDrawerOpen = () => {
    this.setState({ open: true });
  };

  handleDrawerClose = () => {
    this.setState({ open: false });
  };

  render() {
    const { classes, theme } = this.props;
    const openness = this.state.open;

    return (
      <div className={classes.root}>
        <div className={classes.appFrame}>
          <AppBar
            className={classNames(
              classes.appBar,
              openness && classes.appBarShift
            )}
          >
            <Toolbar disableGutters={!openness}>
              <IconButton
                color="inherit"
                aria-label="open drawer"
                onClick={this.handleDrawerOpen}
                className={classNames(
                  classes.menuButton,
                  openness && classes.hide
                )}
              >
                <MenuIcon />
              </IconButton>
              <Typography type="title" color="inherit" noWrap>
                {ui.text}
              </Typography>
            </Toolbar>
          </AppBar>
          <Drawer
            type="permanent"
            classes={{
              paper: classNames(
                classes.drawerPaper,
                !openness && classes.drawerPaperClose
              )
            }}
            open={openness}
          >
            <div className={classes.drawerInner}>
              <div className={classes.drawerHeader}>
                <IconButton onClick={this.handleDrawerClose}>
                  {theme.direction === "rtl" ? (
                    <ChevronRightIcon />
                  ) : (
                    <ChevronLeftIcon />
                  )}
                </IconButton>
              </div>
              <Divider />
              <MenuContent />
              {/* <List className={classes.list}>{mailFolderListItems}</List>
              <Divider />
              <List className={classes.list}>{otherMailFolderListItems}</List>*/}
            </div>
          </Drawer>
          <main className={classes.content}>{this.props.children}</main>
        </div>
      </div>
    );
  }
}

// MiniDrawer.propTypes = {
//   classes: PropTypes.object.isRequired,
//   theme: PropTypes.object.isRequired,
// };

export default withStyles(styles, { withTheme: true })(observer(MiniDrawer));
