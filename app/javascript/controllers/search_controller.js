import { Controller }  from "@hotwired/stimulus"
import { get } from '@rails/request.js'
import debounce from 'debounce'
export default class extends Controller {
    initialize() {
        this.submit = debounce(this.submit.bind(this),300)
    }

    static targets = ["query", "cocktails"]
    submit() {
        // const value = this.queryTarget.value
        // fetch(`/admin/attendance?query=${value}`, {
        //     headers: { accept: 'application/json'}
        // }).then((response) => response.text())
        //     .then(data => console.log(data))

        this.element.requestSubmit()
    }
}