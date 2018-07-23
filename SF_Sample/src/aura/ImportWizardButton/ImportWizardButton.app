<aura:application controller="ImportWizardButtonCtrl" extends="force:slds" implements="force:appHostable,flexipage:availableForAllPageTypes">
	<div>
        <ui:button label="Import" 
                   class="slds-button slds-m-top--medium"
                   labelClass="label"
                   press="{!c.goToImportWizard}"/>
        
    </div>
</aura:application>