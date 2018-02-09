import React, { Component }             from 'react'
import PropTypes                        from 'prop-types'
import { withStyles, createStyleSheet } from 'material-ui/styles'

import Typography            from 'material-ui/Typography'
import Button                from 'material-ui/Button'
import Paper                 from 'material-ui/Paper'

import CloudUploadIcon            from 'material-ui-icons/CloudUpload'
import ProgressBar from './ProgressBar.jsx'


const styles = require('./index.styl')
import { grey } from 'material-ui/colors'
const styleSheet = {
  paper: {
    backgroundColor: '#E0E0E0'
  }
};


class FileUpload extends Component {

  render() {
    const classes = this.props.classes;
    const { uploading, active } = this.props;

    return (
      <div>
        { active &&
          <div className = "dropzone" >
            <Paper className = {classes.paper + ' content'} >
              <Button fab color="accent">
                <CloudUploadIcon/>
              </Button>
            </Paper>
          </div>
        }

        { uploading &&
          <div className = "dropzone" >
            <Paper className = {classes.paper + ' content'} >
              <ProgressBar progress = { 24 } />
            </Paper>
          </div>
        }



      </div>
    );

  }
}

export default withStyles(styleSheet)(FileUpload);