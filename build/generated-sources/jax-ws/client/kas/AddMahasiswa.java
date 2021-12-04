
package client.kas;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for addMahasiswa complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="addMahasiswa"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="npm" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *         &lt;element name="nama" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="kelas" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="bulan" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="pembayaran" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "addMahasiswa", propOrder = {
    "npm",
    "nama",
    "kelas",
    "bulan",
    "pembayaran"
})
public class AddMahasiswa {

    protected int npm;
    protected String nama;
    protected String kelas;
    protected String bulan;
    protected String pembayaran;

    /**
     * Gets the value of the npm property.
     * 
     */
    public int getNpm() {
        return npm;
    }

    /**
     * Sets the value of the npm property.
     * 
     */
    public void setNpm(int value) {
        this.npm = value;
    }

    /**
     * Gets the value of the nama property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNama() {
        return nama;
    }

    /**
     * Sets the value of the nama property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNama(String value) {
        this.nama = value;
    }

    /**
     * Gets the value of the kelas property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getKelas() {
        return kelas;
    }

    /**
     * Sets the value of the kelas property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setKelas(String value) {
        this.kelas = value;
    }

    /**
     * Gets the value of the bulan property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBulan() {
        return bulan;
    }

    /**
     * Sets the value of the bulan property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBulan(String value) {
        this.bulan = value;
    }

    /**
     * Gets the value of the pembayaran property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPembayaran() {
        return pembayaran;
    }

    /**
     * Sets the value of the pembayaran property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPembayaran(String value) {
        this.pembayaran = value;
    }

}
