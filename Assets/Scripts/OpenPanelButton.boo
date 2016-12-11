import UnityEngine
import System.Collections
import System.Collections.Generic

class OpenPanelButton (MonoBehaviour):
        
    public openAutomatically as bool
        
    public panel as Transform
    public anim as Animator
    public textBox as TextBox
     
    private originalScale as Vector3
     
    def Awake():
        originalScale = transform.localScale
        panel.localPosition = Vector3(0, 0, -10)

        if openAutomatically == true:
            OnMouseDown()

    def OnMouseDown():
        transform.localScale = originalScale
        panel.position = transform.position
        LeanTween.move(panel.gameObject, Vector3(0, 0, -22), 0.25f)
        anim.SetBool("Visible", true)
        textBox.ShowText()
        
    def OnMouseEnter():
        LeanTween.scale(gameObject, originalScale * 1.25f, 0.2f)

    def OnMouseExit():
        LeanTween.scale(gameObject, originalScale, 0.1f)
