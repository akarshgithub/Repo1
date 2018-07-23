<aura:application implements="force:appHostable,flexipage:availableForAllPageTypes" controller="InsertAccountCtrl" extends="force:slds">
    <ltng:require styles="{!$Resource.Bootstrap}" scripts='/resource/jQuery'/>
    
    <aura:attribute name="searchKey" type="String"/>
    <aura:attribute name="accs" type="WrapperClass[]"/> 
    <aura:attribute name="acc" type="Account"
                    default="{ 'sobjectType': 'Account',
                             'Name': '',
                             }"/>
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    
    <div class="slds-grid slds-m-top--large">
        <div class="slds-col slds-size--1-of-3"></div>
        <div class="slds-col slds-size--1-of-3">
            <div class="slds-page-header" role="banner">
                <div class="slds-grid">
                    
                    <div class="slds-col slds-has-flexi-truncate">
                        <!-- HEADING AREA -->
                        <p class="slds-text-title--caps slds-line-height--reset">Accounts</p>
                        <h1 class="slds-page-header__title slds-truncate" title="My Accounts">My Accounts</h1>
                        <!-- / HEADING AREA -->
                    </div>
                    <div class="slds-col slds-has-flexi-truncate"></div>
                    <div class="slds-col slds-has-flexi-truncate"></div>
                </div>        
            </div>
            <form>
                <div aria-labelledby="newaccountform">
                    <fieldset class="slds-box slds-theme--default">
                        <legend id="newaccountform" class="slds-text-heading--medium slds-p-vertical--medium">Add a new account</legend>
                        <div> 
                            <ui:inputText aura:id="AccountName" label="Account Name"
                                          class="slds-input"
                                          labelClass="slds-form-element__label"
                                          value="{!v.acc.Name}"
                                          required="true"/>
                        </div>
                        
                        <div>
                            <ui:button label="Submit" 
                                       class="slds-button slds-m-top--medium"
                                       labelClass="label"
                                       press="{!c.createAccount}"/>
                            
                        </div>
                    </fieldset>
                </div>
            </form>
            
            <div class="slds-grid slds-m-top--medium">
                <div class="slds-col slds-medium-size--5-of-6">
                    <div>
                        <ui:inputText label="Search" aura:id="search" 
                                      class="slds-input"
                                      labelClass="slds-form-element__label"
                                      value="{!v.searchKey}" 
                                      updateOn="keyup"
                                      keyup="{!c.showAccList}" />
                        
                    </div>
                    
                </div>
                <div class="slds-col slds-medium-size--1-of-6">
                    <ui:inputSelect class="slds-picklist slds-dropdown-trigger slds-dropdown-trigger--click slds-align--absolute-center slds-m-top--large" aura:id="ListSize" change="{!c.showAccList}">
                        <ui:inputSelectOption text="5" label="5" value="true"/>
                        <ui:inputSelectOption text="10" label="10"/>
                        <ui:inputSelectOption text="20" label="20"/>
                    </ui:inputSelect> 
                </div>
            </div>
            
            <div class="slds-m-top--medium">
                <table class="slds-table slds-table--bordered slds-table--cell-buffer">
                    <thead>
                        <tr class="slds-text-title--caps">
                            <th scope="col"><div class="slds-truncate" title="Opportunity Name">Icon</div></th>
                            <th scope="col"><div class="slds-truncate" title="Opportunity Name">Firstname</div></th>
                            <th scope="col"><div class="slds-truncate" title="Opportunity Name">Select</div></th>
                        </tr>
                    </thead>  
                    <tbody>
                        <aura:iteration var="ac" items="{!v.accs}">
                            
                            <tr>
                                <td><div class="slds-truncate">
                                    <img src="{'assets/images/avatar1.jpg'}" alt="" /></div>
                                </td>
                                <td><div class="slds-truncate">{!ac.acc.Name}</div></td>
                                <td><div class="slds-truncate"><ui:inputCheckbox value="{!ac.check}"/></div></td>
                            </tr>
                            
                        </aura:iteration>    
                    </tbody>
                </table> 
            </div>
            <div>       
                <div class="slds-m-top--medium">
                    <ui:button label="Cancel" 
                               class="slds-button slds-button--neutral slds-float--right"
                               labelClass="label"
                               press="{!c.cancel}"/>     
                </div>  
                <div class="slds-m-top--medium">
                    <ui:button label="Delete" 
                               class="slds-button slds-button--neutral slds-float--right"
                               labelClass="label"
                               press="{!c.delAccount}"/>     
                </div> 
                <div class="slds-m-top--medium">
                    <ui:button label="Send Email" 
                               class="slds-button slds-button--neutral slds-float--right"
                               labelClass="label"
                               press="{!c.openModal}"/>     
                </div>    
            </div>           
        </div>
        <div class="slds-col slds-size--1-of-3"></div>
    </div>
    <!-- Modal Popup -->
    <div id="modal" style="display:none;">
        <div role="dialog" tabindex="-1" aria-labelledby="header43" class="slds-modal slds-modal--medium   slds-fade-in-open">
            <div class="slds-modal__container modalwidth">
                <div class="slds-modal__header bckgrdcolor">
                    <h2 id="header43" class="slds-text-heading--medium herdrstyle" style=" margin:0px; text-align:left;">Send Email</h2>
                </div>
                <div class="slds-modal__content slds-p-around--medium">
                    <div>
                        <p>Subject :</p>
                        <ui:inputText class="slds-input" placeholder="Subject..." aura:id="subject"/>
                    </div><br/>
                    
                    <div>
                        <p>Body :</p>
                        <ui:inputTextArea class="slds-input" placeholder="Body..." aura:id="body"/>
                    </div>
                </div>
                <div class="slds-modal__footer" style="padding:20px 20px 20px 20px;">
                    <button class="slds-button slds-button--brand" onclick="{!c.sendMail}">Send Email</button>
                    
                    <button class="slds-button slds-button--neutral" onclick="{!c.closeModal}">Cancel</button>
                </div>
            </div>
        </div><br/>
        <div class="slds-backdrop slds-backdrop--open"></div>
    </div>
</aura:application>