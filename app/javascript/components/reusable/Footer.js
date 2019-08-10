import React, { Component } from 'react';
import { FormattedMessage } from 'react-intl';

class Footer extends Component {
  render() {
    return (
      <div className='footer'>
        <p>
          <a href='/terms_of_use' className='slidingLink footerLink' target='_blank' rel='noreferrer noopener nofollow'>
            <FormattedMessage
              id='Footer.termsLink'
            />
          </a>
        </p>
        <p>
          Copyright © 2017 Tutoria, Inc. All rights reserved.
        </p>
        <p>
          495A Henry St #1020, Brooklyn, NY, 11231, United States of America
        </p>
      </div>
    );
  }

}

export default Footer;
