
function init(jsonHash){
  handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers(jsonHash);
          handler.bounds.extendWith(markers);
          handler.fitMapToBounds();
    });
}
