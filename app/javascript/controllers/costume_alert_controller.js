import { Alert } from "tailwindcss-stimulus-components"

export default class CostumeAlert extends Alert {
    connect() {
        setTimeout(super.close() , 5000);
    }
}