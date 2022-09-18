import { Controller } from '@hotwired/stimulus';
import { get } from '@rails/request.js'
export default class extends Controller {
    static targets = [ "name", "output" ]

    handleChange() {
        let country = this.nameTarget.value
        let target = this.outputTarget.id
       get(`http://127.0.0.1:3000/user_profile_admin/cites?target=${target}&country=${country}`,{
            responseKind:"turbo-stream"
       })
        console.log(country)
    }

    setOffice(){
        // console.log(this.outputTarget.value)
        // return (this.output)
    }
}