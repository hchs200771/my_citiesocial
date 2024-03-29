require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// import actiontext
import "trix"
import "@rails/actiontext"

import "controllers"
import "../styles/backend"
import "../styles/shared"
import "../scripts/backend"
import "../scripts/shared"
