package com.sterp.multitenant.tenant.compaign.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.campaign.Campaign;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;

public interface CampaignRepository extends JpaRepository<Campaign,Long> {
	
	@Query(value="SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(c.id,c.campaignName)"
			+" From com.sterp.multitenant.tenant.campaign.Campaign c ORDER BY c.campaignName")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

	//List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
