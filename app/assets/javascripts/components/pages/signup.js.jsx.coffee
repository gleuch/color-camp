@ColorSignupPage = React.createClass
  render : ->
    `<ColorSignupLogin {...this.props} signup={true} />`

@ColorLoginPage = React.createClass
  render : ->
    `<ColorSignupLogin {...this.props} signup={false} />`

@ColorSignupLogin = React.createClass
  getInitialState : ->
    { }

  componentDidMount : ->
    #

  componentWillUnmount : ->
    #

  componentWillUpdate : (p,s)->
    #

  componentDidUpdate : (p,s)->
    #

  render : ->
    if this.props.current_user
      content = `<div>
        <p>You are currently logged in as {this.props.current_user.name}. <ColorLink to={'/u/' + this.props.current_user.login}>Click here to view your profile</ColorLink></p>
      </div>`

    else
      signin_providers = []
      this.props.signin_providers.map (provider)->
        providerName = provider.name.toLowerCase()
        signin_providers.push `
          <li key={providerName}>
            <a href={provider.url} className={"btn btn-default btn-" + providerName}>connect via {providerName}</a>
          </li>`

      content = `<span>
        <section>
          <h1>signup / login</h1>
          <p>to see a visual history of your browsing experience is a simple as signing in through Facebook or Twitter. after that, just download the Google Chrome extension.</p>
          <ul className="buttons">
            {signin_providers}
          </ul>
          <p className="disclaimer">* we do not sell or use your information for any other purpose but to visualize your browisng experience. afterall, this is only an art piece, not a unicorn startup failure. however, by signing in through any or all of the above services, you agree to share information about yourself and web sites you visit. any information you publish will be shared publicly for others to see. additionally, your information may be used in other features for this art piece or future works of art in this series by <a href="https://gleu.ch">Greg Leuch</a>.</p>
        </section>
      </span>`

    `<ColorStaticPageDisplay content={content} pageName="signup-login" />`
