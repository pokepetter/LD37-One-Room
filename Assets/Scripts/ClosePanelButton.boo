import UnityEngine

class ClosePanelButton (MonoBehaviour):
	
    public anim as Animator
    public destroy as bool = true
    public destroyTarget as GameObject

    def OnMouseDown():
        anim.SetBool("Visible", false)
        Destroy(destroyTarget, 0.1f)