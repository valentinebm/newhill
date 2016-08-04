function getElapsedSecondsSince(creationTime, element) {
  setInterval(function () {

        var creationDate = parseInt($(creationTime).text())
        var timeNow = Date.now() / 1000
        var timeDiff = timeNow - creationDate
        var timeDiffSecs = timeDiff;
        var secondsBetweenDates = Math.round(timeDiffSecs)
        var timeElapsed = humanizeDuration(secondsBetweenDates*1000)


        $(element).html(timeElapsed)

      }, 1000);
}

getElapsedSecondsSince('.created_at', '.timer');
