import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
    static targets = [ "name", "output","city_name" ,"output_place" ]

    select_cities() {
        let country = this.nameTarget.value
        let target = this.outputTarget.id
        get(`http://127.0.0.1:3000/admin/create_role/set_cities?target=${target}&country_id=${country}`,{
            responseKind:"turbo-stream"
        })

    }



    select_offices(){
        let city = this.city_nameTarget.value
        let target = this.output_placeTarget.id
        get(`http://127.0.0.1:3000/admin/create_role/set_offices?target=${target}&city_id=${city}`,{
            responseKind:"turbo-stream"
        })
    }
}
