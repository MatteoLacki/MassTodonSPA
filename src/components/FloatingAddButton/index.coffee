import { React, createReactClass, e, DOM } from 'app/react-tools'
import Button from '@material-ui/core/Button';
import AddIcon from '@material-ui/icons/Add';
import { withStyles } from '@material-ui/core/styles';

styleSheet = {
	btn: {
		position: 'fixed',
		margin: '0px',
		top: 'auto',
		right: '30px',
		bottom: '20px',
		left: 'auto'
	},
};

FloatingActionButtons = (p) ->
	e Button, {
		variant: 'fab'
		color: 'primary',
		className: p.classes.btn
	},
		e AddIcon, {}

export default withStyles(styleSheet, { withTheme: true })(FloatingActionButtons);
