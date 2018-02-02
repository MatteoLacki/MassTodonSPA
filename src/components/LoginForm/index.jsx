import React, {Component} from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import Typography from 'material-ui/Typography';
import TextField from 'material-ui/TextField';
import { Button, Divider, Grid } from 'material-ui/'

const _ = require('lodash');


const styleSheet = (theme) => {
  return ({
    root: {
      padding: `${theme.spacing.unit * 2}px`
    },
    container: {
      height: '100vh',
    },
    input: {
    },
    divider: {
      marginTop: 24,
      marginBottom: 24,
      width: '100%'
    },
    gridRoot: {
      flexGrow: 1,
      height: '100vh',

    }
  });
}


class MyLoginForm extends Component {
  state = {
    email: '',
    password: '',
  };

  // handleRequestClose = () => {
  //   this.setState({ open: false });
  // };

  // confirmClose = () =>
  // {
  //   this.setState({ open: false });
  //   this.props.confirm()
  // };



  render() {
    const classes = this.props.classes

    const actions = this.props.actions

    return (
        <Grid
            className={classes.gridRoot}
            container
            gutter = { 16 }
            direction = "row"
            justify = "center"
            align = "center"
        >
          <Grid item xs={11} md={6} lg={4} >
            <Paper className={classes.root} elevation={4}>
              <Grid container gutter = {16} direction = "column" justify = "center" align = "stretch"  >
                <Grid item>
                  <Typography type="headline" component="h3">
                    Sign In Into the MassTodon App
                  </Typography>
                  <Typography type="body1" component="p">
                    (you can use a special email or Google)
                  </Typography>
                </Grid>

                <Grid item>
                  <TextField
                    id="email"
                    label="Login (email)"
                    autoFocus
                    className={classes.input}
                    InputProps={{ placeholder: 'Your email' }}
                    type="text"
                    value = {this.state.email}
                    onChange={event => this.setState({ email: event.target.value })}
                    fullWidth = { true }
                  />
                  <TextField
                    id="password"
                    label="Password"
                    className={classes.input}
                    value = {this.state.password}
                    onChange={event => this.setState({ password: event.target.password })}
                    type="password"
                    fullWidth = { true }
                  />
                </Grid>

                <Grid item>
                  <Button raised color="primary" > Sign In</Button>
                </Grid>

                <Grid item >
                  <Divider
                    className = {classes.divider}
                    light = { false } />
                </Grid>

                {
                  (_.isFunction(actions.signInWithGoogle)) &&
                    <Grid item >
                      <Button raised color="primary" onClick = {actions.signInWithGoogle} > Sign In With Google</Button>
                    </Grid>
                }



              </Grid>
            </Paper>
          </Grid>
        </Grid>
    );
  }
}

MyLoginForm.propTypes = {
  classes: PropTypes.object.isRequired,
}

export default withStyles(styleSheet)(MyLoginForm)
