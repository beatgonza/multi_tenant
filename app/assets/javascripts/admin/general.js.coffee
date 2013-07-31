$ ->  
  $(".image_uploader").on "change", (e) ->
    input = e.target
    $this = $(this)
    if input.files && input.files[0]
      reader = new FileReader()
      reader.onload = (e) ->
        $container = $this.parents("fieldset.inputs")
        $container.find(".image_field").attr("src", e.target.result).show()

      reader.readAsDataURL input.files[0]

  $(".minicolor").minicolors()