import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["html"]

    htmlToCSV(html, filename) {
        var data = [];
        var rows = document.getElementById("attendance_table");
        var len = rows.rows[0].querySelectorAll("td:not([style*=\"display: none\"]), th:not([style*=\"display: none\"])").length;
        // console.log(rows)
        // console.log(rows.rows[1].querySelectorAll("td:not([style*=\"display: none\"])"))
        // return false
        for (var i = 0; i < len ; i++) {
            var row = [], cols = rows.rows[i].querySelectorAll("td:not([style*=\"display: none\"]), th:not([style*=\"display: none\"])");
            // console.log( rows.rows[1].querySelectorAll("td :not([style*=\"display: none\"]), th:not([style*=\"display: none\"])"))
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