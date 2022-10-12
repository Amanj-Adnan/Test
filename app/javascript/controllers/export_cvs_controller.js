import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["html"]

    connect() {
        console.log('amanj')
    }


    htmlToCSV(html, filename) {
        console.log(document.querySelector("table tr").innerText)
        // console.log(document.getElementById("attendance_table").innerText)

        var data = [];
        var rows = document.getElementById("attendance_table");
        for (var i = 0; i < rows.rows.length; i++) {
            var row = [], cols = rows.rows[i].querySelectorAll("td, th");
            // console.log( rows.rows[1].querySelectorAll("td, th"))
            for (var j = 0; j < cols.length; j++) {
                row.push(cols[j].innerText);
            }
            data.push(row.join(","));
        }
        this.downloadCSVFile(data.join("\n"), 'attendance');
    }

    downloadCSVFile(csv, filename) {
        var csv_file, download_link;
        csv_file = new Blob([csv], {type: "text/csv"});
        download_link = document.createElement("a");
        download_link.download = filename;
        download_link.href = window.URL.createObjectURL(csv_file);
        download_link.style.display = "none";
        document.body.appendChild(download_link);
        download_link.click();
    }
}