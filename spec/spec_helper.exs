ESpec.configure fn(config) ->
  config.before fn(tags) ->
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end

  config.formatters [
    {ESpec.JUnitFormatter, %{out_path: "_build/test/lib/conta_comigo/results.xml"}}
  ]
end
