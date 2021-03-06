class TabBar extends EventsSupport

  constructor: ->
    #setup the events support
    super "tab", ["willchange", "didchange"]

  setStyleId: (options={}, callbacks={}) ->

    styleId = if options.constructor.name == "String"
      options
    else
      options.styleId

    steroids.nativeBridge.nativeCall
      method: "setTabBarStyleId"
      parameters:
        styleId: styleId
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  setStyleCSS: (options={}, callbacks={}) ->

    styleCSS = if options.constructor.name == "String"
      options
    else
      options.styleCSS

    steroids.nativeBridge.nativeCall
      method: "setTabBarStyleCSS"
      parameters:
        styleCSS: styleCSS
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  addStyleClass: (options={}, callbacks={}) ->

    styleClass = if options.constructor.name == "String"
      options
    else
      options.styleClass

    steroids.nativeBridge.nativeCall
      method: "addTabBarStyleClass"
      parameters:
        styleClass: styleClass
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  setStyleClass: (options={}, callbacks={}) ->

    styleClass = if options.constructor.name == "String"
      options
    else
      options.styleClass

    steroids.nativeBridge.nativeCall
      method: "setTabBarStyleClass"
      parameters:
        styleClass: styleClass
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  hide: (options={}, callbacks={}) ->
    steroids.debug "steroids.tabBar.hide options: #{JSON.stringify options} callbacks: #{JSON.stringify callbacks}"

    steroids.nativeBridge.nativeCall
      method: "hideTabBar"
      parameters: {}
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  show: (options={}, callbacks={}) ->
    steroids.debug "steroids.tabBar.show options: #{JSON.stringify options} callbacks: #{JSON.stringify callbacks}"

    steroids.nativeBridge.nativeCall
      method: "showTabBar"
      parameters: {}
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  selectTab: (options={}, callbacks={}) ->
    steroids.debug "steroids.tabBar.selectTab options: #{JSON.stringify options} callbacks: #{JSON.stringify callbacks}"

    @index = if options.constructor.name is "Number"
      options
    else
      options.index

    steroids.nativeBridge.nativeCall
      method: "selectTab"
      parameters:
        index: @index
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]

  currentTab:
    update: (options={}, callbacks={}) ->
      steroids.nativeBridge.nativeCall
        method: "updateTab"
        parameters: options
        successCallbacks: [callbacks.onSuccess]
        failureCallbacks: [callbacks.onFailure]

  update: (options={}, callbacks={}) ->
    steroids.debug "steroids.tabBar.update options: #{JSON.stringify options} callbacks: #{JSON.stringify callbacks}"

    if options.constructor.name == "Object"
      parameters = {}
      parameters.position = options.position
      parameters.tabs = []
      if options.tabs
        for scale in [0...options.tabs.length]
          parameters.tabs.push(
            {
              title: options.tabs[scale].title
              image_path: options.tabs[scale].icon
              badge: options.tabs[scale].badge
              styleClass : options.tabs[scale].styleClass
              styleId : options.tabs[scale].styleId
              styleCSS : options.tabs[scale].styleCSS
            }
          )

    steroids.nativeBridge.nativeCall
      method: "updateTabs"
      parameters: parameters
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]


  replace: (options={}, callbacks={}) ->
    steroids.debug "steroids.tabBar.replace options: #{JSON.stringify options} callbacks: #{JSON.stringify callbacks}"

    if options.constructor.name == "Object"
      parameters = {}
      parameters.tabs = []
      for scale in [0...options.tabs.length]
        parameters.tabs.push(
          {
            target_url: options.tabs[scale].location
            title: options.tabs[scale].title
            image_path: options.tabs[scale].icon
            position: options.tabs[scale].position
            styleClass : options.tabs[scale].styleClass
            styleId : options.tabs[scale].styleId
            styleCSS : options.tabs[scale].styleCSS
          }
        )

      steroids.nativeBridge.nativeCall
        method: "replaceTabs"
        parameters: parameters
        successCallbacks: [callbacks.onSuccess]
        failureCallbacks: [callbacks.onFailure]
