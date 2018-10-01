import { _, React, mobxReact } from 'app/react-tools'
import Grid       from '@material-ui/core/Grid'
import ConfigCard from 'components/ConfigCard'


function ConfigList(props) {
  _.map(props.list, (el, key) =>{
    console.log('-->', el, key)
  })
  return (
    <Grid container direction="column" justify="flex-start" align="stretch">
      {
        _.map(props.list, (el, key) =>
          <Grid item key={key} xs={11}>
            <ConfigCard
              data = { el }
              name = { el.configName }
              actions = {{
                  delete: (event) => props.actions.delete(key)
              }}
            />
          </Grid>
        )
      }
    </Grid>
  );
}


export default mobxReact.observer(ConfigList)
