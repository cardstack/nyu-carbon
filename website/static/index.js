
function postData(url, data) {
  // Default options are marked with *
  return fetch(url, {
      body: JSON.stringify(data), // must match 'Content-Type' header
      cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'same-origin', // include, same-origin, *omit
      headers: {
          'user-agent': 'Example',
          'content-type': 'application/json'
      },
      method: 'POST', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, cors, *same-origin
      redirect: 'follow', // manual, *follow, error
      referrer: 'no-referrer', // *client, no-referrer
  })
      .then(response => response.json()) // output json
}
    
    function showtable()
    {
        $('#gridTable1').bootstrapTable({
                    data: mydata
                });
    }
            $("#btn_search").click(function () {
                showtable()
            });

    function submit(){

      console.log("ok")
    }