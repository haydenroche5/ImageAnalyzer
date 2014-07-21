$(document).ready ->

  window.processImage = ->
    canvas = document.getElementById("seedCanvas")
    context = canvas.getContext("2d")
    avgRed = 0
    avgGreen = 0
    avgBlue = 0
    totalRed = 0
    totalGreen = 0
    totalBlue = 0

    image = document.getElementById('dummyImage')
    image.crossOrigin = ""

    canvas.height = image.height
    canvas.width = image.width

    context.drawImage image, 0, 0
    imgData = context.getImageData(0, 0, canvas.width, canvas.height)
    data = imgData.data
    TOTAL_PIX = data.length / 4
    i = 0
    n = data.length

    while i < n
      totalRed += data[i]
      totalGreen += data[i + 1]
      totalBlue += data[i + 2]
      i += 4
    avgBlue = totalRed / (TOTAL_PIX)
    $("#avgR").html "Average R: " + avgRed
    $("#avgG").html "Average G: " + avgGreen
    $("#avgB").html "Average B: " + avgBlue
    return

  window.upload = ->
    seedName = seedForm.elements["seedURL"].value
    seedName = '/get_image?name=Hayden&image_location=' + encodeURIComponent(seedName)
    # $.ajax
    $("#dummyImage").attr "src", seedName
    $("#dummyImage").on('load', ->
      processImage()
    )

  return
